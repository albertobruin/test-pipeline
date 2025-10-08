""" @bruin

name: stress.test
secrets:
    - key: neon
      inject_as: test_conn

@bruin """
from streamer import streamer

if __name__ == "__main__":
    streamer.main()
