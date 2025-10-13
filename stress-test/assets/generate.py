# generate_stress_tests.py

N = 100  # change this to however many files you want

template = """\"\"\" @bruin

name: stress.test_{n}
secrets:
    - key: neon
      inject_as: test_conn

@bruin \"\"\"
from streamer import main

if __name__ == "__main__":
    main()
"""

for i in range(N + 1):  # generates from 0 to N inclusive
    filename = f"stress_test_{i}.py"
    with open(filename, "w") as f:
        f.write(template.format(n=i))
    print(f"Created {filename}")