""" @bruin

name: stress.test_70
secrets:
    - key: neon
      inject_as: test_conn

@bruin """
from streamer import main

if __name__ == "__main__":
    main()
