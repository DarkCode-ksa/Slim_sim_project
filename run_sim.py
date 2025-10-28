import os
import subprocess
import matplotlib.pyplot as plt
import pandas as pd

# مسار SLiM
slim_path = os.path.expanduser("~/bin/slim")
script_path = "hypothesis.slim"

# تشغيل المحاكاة
print("تشغيل محاكاة SLiM...")
subprocess.run([slim_path, script_path])

# تحليل النتائج (مثال)
print("تحليل النتائج...")
df = pd.DataFrame({"Generation": [1, 2, 3], "AlleleFreq": [0.1, 0.2, 0.35]})
plt.plot(df["Generation"], df["AlleleFreq"], marker='o')
plt.xlabel("Generation")
plt.ylabel("Allele Frequency")
plt.title("Hypothesis Simulation Result")
plt.show()
