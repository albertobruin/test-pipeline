""" @bruin

name: python.oom_test
secrets:
    - key: NEON
      inject_as: test_conn

instance: b1.small

@bruin """

import os
import time

print("Starting memory consumption test...")
print("This script will consume memory until the pod runs out")

# Start consuming memory by creating large lists
memory_hogs = []
chunk_size = 10**6  # 1 million integers per chunk
chunk_count = 0

# try:
#     while True:
#         # Create a large list of integers
#         chunk = list(range(chunk_size))
#         memory_hogs.append(chunk)
#         chunk_count += 1
        
#         # Print progress every 100 chunks
#         if chunk_count % 100 == 0:
#             estimated_mb = chunk_count * chunk_size * 8 / (1024 * 1024)  # rough estimate
#             print(f"Allocated {chunk_count} chunks (~{estimated_mb:.1f} MB)")
        
#         # Small sleep to avoid overwhelming the system immediately
#         time.sleep(0.01)
        
# except MemoryError:
#     print(f"Memory exhausted after {chunk_count} chunks")
#     print("Pod should be running out of memory now")
# except KeyboardInterrupt:
#     print(f"Interrupted after {chunk_count} chunks")

print("All good in the hood.")