# coding: utf-8

import swat
import argparse
import os
import os.path
import json
from pprint import pprint

# parse arguments
parser = argparse.ArgumentParser(description='Score')
parser.add_argument('-m', dest="modelFile",required=False,  help='model metadata filename')
parser.add_argument('-i', dest="scoreInputCSV", required=True, help='input csv filename')
parser.add_argument('-o', dest="scoreOutputCSV", required=True, help='output csv filename')

args = parser.parse_args()
modelFile = args.modelFile
scoreInputCSV = args.scoreInputCSV
scoreOutputCSV = args.scoreOutputCSV


# In[ ]:


# set up environment variable for ca cert
os.environ["CAS_CLIENT_SSL_CA_LIST"] = "vault-ca.crt"


# In[ ]:


# Connect to CAS
casServer='summer.edmt.sashq-d.openstack.sas.com'
casPort=5570
mycas=swat.CAS(hostname=casServer,port=casPort,username='edmdev',password='{SAS002}94FD31094983BB1700E83122560D9CFB')


# In[ ]:


# upload input data to CAS
#scoreInputCSV='hmeq.csv'
if not os.path.isfile(scoreInputCSV):
    print('Not found input file',scoreInputCSV)
    sys.exit()
    
out=mycas.upload(scoreInputCSV,casout=dict(name='_scoreInput_',caslib='public',replace=True))
inputDS=out['casTable']


# In[ ]:


# parse the model json file to get the model caslib and filename
#modelCaslib='public'
#modelPath='dtree_model.sashdat'
if not modelFile:
    modelFile='fileMetadata.json'

with open(modelFile) as f:
    data = json.load(f)

pprint(data)

for m in data:
    if m['role'].lower() == 'model':
        modelCaslib=m['caslib']
        modelPath=m['name']
        


# In[ ]:


# load the CAS model to CAS Server

r=mycas.loadTable(caslib=modelCaslib,path=modelPath,loadAttrs=True,casout=dict(caslib='public',replace=True))
dtreeModel=r['casTable']


# In[ ]:


# run Scoring
scoreOut=dict(name='_scoreOutput_',caslib='public',replace=True)
mycas.loadactionSet('decisionTree')
inputDS.dtreescore(
    model=dtreeModel,
    casOut=scoreOut,
    encodeName=True
)
outputDS=mycas.CASTable('_scoreOutput_',caslib='public')
outputDS.fetch(to='10')


# In[ ]:


# export the scored output to CSV file

#scoreOutputCSV='hmeq_scored_out.csv'
outputDS.to_csv(scoreOutputCSV, sep=',', index=False)


# In[ ]:


mycas.close()

