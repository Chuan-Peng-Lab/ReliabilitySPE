#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import matplotlib.pyplot as plt


# In[2]:


get_ipython().run_line_magic('matplotlib', 'inline')
import hddm
import kabuki
print(hddm.__version__)

# Preparation
import os, time, csv, datetime
import kabuki, hddm
from kabuki.analyze import gelman_rubin

from datetime import date

import random
import pandas as pd
import matplotlib.pyplot as plt


# In[3]:


# define a function to run model in parallel
#full model v,z depend on 'Match','Session', 'stim', t depend on match, session
def run_model(id):
    print('running model%i'%id);
    
    import hddm
    import random


    exp_name = 'Test_retest_sim' #project name
    print('running models %i'%id, 'for for exp', exp_name)
    
    # USE the absolute directory in docker.
    dbname = '/home/jovyan/example/df_' + exp_name + '_chain_vaz_test_%i.db'%id # define the database name, which uses pickle format
    mname  = '/home/jovyan/example/df_' + exp_name + '_chain_vaz_test_%i'%id    # define the name for the model
    fname  = '/home/jovyan/example/df_' + exp_name + '.csv'
    df = hddm.load_csv('/home/jovyan/example/simulate_data_fitting_DDM.csv') #import dataset
    df = df.rename(columns = {'ACC':'response','Identity':'stim','RT_ms':'rt','Subject':'subj_idx'})
    df['rt'] = df["rt"]/1000

    m = hddm.HDDMStimCoding(df, 
                            include='z', 
                            stim_col='response', #define boundary
                            depends_on={'v':['Match','Session', 'stim'],
                                       'z':['Match','Session', 'stim'],
                                       't':['Match','Session']},#define the depend-on relationship
                            split_param='v', 
                            drift_criterion=False,
                            p_outlier=0.05)

    m.find_starting_values()
    m.sample(2500, burn=1000, dbname=dbname, db='pickle') 
    m.save(mname)
    
    return m


# In[4]:


# define a function to check the progress bar of the sampling
import sys
import time
from IPython.display import clear_output

def wait_watching_stdout(ar, dt=15):
    """
    ar: vmap output of the models being run 
    dt: number of seconds between checking output, you can make is shorter or longer.
    """

    while not ar.ready():
        stdouts = ar.stdout
        if not any(stdouts):
            continue
        # clear_output doesn't do much in terminal environments
        clear_output()
        print('-' * 30)
        print("%.3fs elapsed" % ar.elapsed)
        print("")
        for out in ar.stdout: print(out);
        sys.stdout.flush()
        time.sleep(dt)


# In[5]:


from ipyparallel import Client
v = Client()[:]
start_time = time.time()  # the start time of the processing
jobs = v.map(run_model, range(4))# is the number of CPUs 
wait_watching_stdout(jobs)
models = jobs.get()
print("\nRunning 4 chains used: %f seconds." % (time.time() - start_time))


# In[6]:


x1 = hddm.load('/home/jovyan/example/df_Test_retest_sim_chain_vaz_test_0')
x2 = hddm.load('/home/jovyan/example/df_Test_retest_sim_chain_vaz_test_1')
x3 = hddm.load('/home/jovyan/example/df_Test_retest_sim_chain_vaz_test_2')
x4 = hddm.load('/home/jovyan/example/df_Test_retest_sim_chain_vaz_test_3')


# In[7]:


xn = []
xn.append(x1)
xn.append(x2)
xn.append(x3)
xn.append(c4)
xn = kabuki.utils.concat_models(xn) #combine chains 


# In[8]:


stats = xn.gen_stats()
#save DDM results
stats.to_csv('/home/jovyan/example/test_retest_pilot_ddm_results.csv')






