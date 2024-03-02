import os
import time

import subproces

#subprocess.run(['tracert' 8.8.8.8 > tracert_result.txt])
os.system('cmd "tracert' 8.8.8.8 > tracert_result.txt"')
time_end = time.time()
print(time_start-time_end)