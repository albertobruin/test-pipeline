""" @bruin

name: linear.hello_world
description: Hello world Python asset for Linear ingestion pipeline
tags:
    - linear
    - hello_world
    - python

@bruin """

import os
import time
from datetime import datetime


def main():
    """Main function to execute the hello world asset."""
    print("Hello, World!")
    print(f"Current time: {datetime.now()}")
    print("This is a Python asset for the Linear ingestion pipeline.")
    
    # Simulate some work
    print("Processing Linear data...")
    time.sleep(0.1)  # Small delay to simulate processing
    
    print("Hello world asset completed successfully!")


if __name__ == "__main__":
    main()
