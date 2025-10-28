import subprocess

# Run SLiM simulation
subprocess.run(["slim", "hypothesis.slim"], check=True)

# Process results
with open("results.log", "r") as f:
    print(f.read())
