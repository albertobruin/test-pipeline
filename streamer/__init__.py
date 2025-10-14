# streamer.py
import time
import random
import string

# --- Hard-coded settings ---
MIN_S = 1.0       # minimum total duration (seconds)
MAX_S = 100.0      # maximum total duration (seconds)
INTERVAL = 0.2    # print interval (seconds)
SEED = None       # set to an int for reproducibility
# ---------------------------

def _truncated_normal(lo: float, hi: float, mu: float, sigma: float) -> float:
    """Sample from N(mu, sigma^2) truncated to [lo, hi]."""
    if sigma <= 0:
        return max(lo, min(mu, hi))
    for _ in range(10000):
        x = random.gauss(mu, sigma)
        if lo <= x <= hi:
            return x
    return max(lo, min(random.gauss(mu, sigma), hi))  # rare fallback

def _rand_string(min_len=6, max_len=18) -> str:
    alphabet = string.ascii_letters + string.digits
    n = random.randint(min_len, max_len)
    return ''.join(random.choices(alphabet, k=n))

def main():
    if SEED is not None:
        random.seed(SEED)

    mu = (MIN_S + MAX_S) / 2.0
    sigma = (MAX_S - MIN_S) / 6.0
    # duration = _truncated_normal(MIN_S, MAX_S, mu, sigma)
    duration = 20

    start = time.monotonic()
    next_tick = start
    printed = 0

    try:
        while True:
            elapsed = time.monotonic() - start
            if elapsed >= duration:
                break
            print(f"[{elapsed:6.3f}s] {_rand_string()}", flush=True)
            printed += 1
            next_tick += INTERVAL
            time.sleep(max(0.0, next_tick - time.monotonic()))
    except KeyboardInterrupt:
        pass
    finally:
        total_elapsed = time.monotonic() - start
        print(f"\nDone. Target ~{duration:.3f}s; actual {total_elapsed:.3f}s; lines {printed}.", flush=True)
