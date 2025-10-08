""" @bruin

name: stress.test
secrets:
    - key: neon
      inject_as: test_conn

@bruin """
import streamer

if __name__ == "__main__":
    streamer.main()
