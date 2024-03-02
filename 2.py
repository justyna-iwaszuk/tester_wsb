
import os
import datetime
import time
import shutil
if os.path.exists('./nowy3'):
    shutil.rmtree('nowy3')
print(os.getcwd())
os.chdir('C:\\Users\\admin\\Desktop')
os.mkdir('nowy3')
os.chdir('./nowy3')
for i in range(10):
    time_now = datetime.datetime.now()
    time_now_f = time_now.strftime('%H%M%S')
    file = open(f'report {time_now_f}.txt', 'w')
    file.close()
    time.sleep (3)

