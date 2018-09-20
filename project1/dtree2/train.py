
# coding: utf-8

# In[111]:


import swat


# In[112]:


# connet to CAS Server
casServer='summer.edmt.sashq-d.openstack.sas.com'
casPort=5570
mycas=swat.CAS(hostname=casServer,port=casPort,username='scnkuj',password='{SAS002}CD3BCB1D4BB81242233893980F159CFE490AB807')


# In[113]:


# upload data to CAS
out=mycas.upload('hmeq.csv',casout=dict(name='hmeq',caslib='public',replace=True))


# In[114]:


inputDS=out['casTable']


# In[115]:


inputDS.columnInfo()


# In[116]:


# split data into train / test
mycas.loadactionset('sampling')
rst=inputDS.srs(
    output={"casOut":{"name":"train", "caslib":"public","replace":True},"copyVars":"ALL"},
    samppct=70,
    sampPct2=20,
    partInd=True
)
trainDS=mycas.CASTable('train',caslib='public',where=('_PartInd_=1'))
testDS=mycas.CASTable('train',caslib='public',where=('_PartInd_=2'))


# In[117]:


# build the CAS decisionTree model
inputVars=['LOAN','MORTDUE','VALUE','YOJ','DEROG','DELINQ','CLAGE','CLNO','DEBTINC']
targetVar='BAD'

mycas.loadactionSet('decisionTree')

trainDS.dtreeTrain(
  inputs=inputVars,
  casOut=dict(name='dtreeModel',caslib='public',replace=True),
  target=targetVar,
  nominal=targetVar,
  prune=True,
  includeMissing=False
)


# In[118]:


# run scoring against the test data
dtreeOutModel=mycas.CASTable('dtreeModel',caslib='public')
testDS.dtreescore(
    model=dtreeOutModel,
    casOut=dict(name='hmeq_scored',caslib='public',replace=True),
    encodeName=True
)


# In[119]:


# display the scored output
outputDS=mycas.CASTable('hmeq_scored',caslib='public')
outputDS.fetch(to='10')


# In[122]:


mycas.caslibInfo(caslib='casuser')


# In[109]:


# export the scored output to CSV file
outputDS.save(name='hmeq_scored.csv', caslib='casuser',replace=True)


# In[123]:


# close the CAS session
mycas.close()

