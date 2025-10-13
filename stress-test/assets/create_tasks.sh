#!/bin/bash

# Number of requests to send
N=1000  # Default: 10 requests if no argument is given

# The Bearer token
AUTH="eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImJydWluLWNsb3VkLXVpIiwiaXNfYWRtaW4iOnRydWUsImlzcyI6Im9YciIsImV4cCI6MTc2MDM4OTg1M30.QK-Z7U3ct37kOAT84gW8JIybZolcuX16fA3hzbzgsprznE8Dag2G79c07ozDLaWIShmyECvhpcXxhy2F6-a8XgEHo6Q6M0ceUbSPhRQGyja6FUGe4NvlE96A1K560H-KZfQnmLHbvwE_KM1b7vDzYEj_ValtOp5jkYOy7KEE_f8"

# Target URL
URL="https://cloud.getbruin.com/api/orchestrator/task"

for ((i=1; i<=N; i++)); do
  # Compute sha256 of the character "n" (as requested)
  MICROTIME=$(date +%s%N)
  HASH=$(echo -n "n${MICROTIME}" | sha256sum | awk '{print $1}')
  
  # Build JSON payload
  DATA=$(cat <<EOF
{
  "oxr_id": "v1.${HASH}",
  "client_id": "albertotest",
  "project_id": "albertotest",
  "pipeline_id": "albertotest-stress-test",
  "relative_path": "stress-test/assets/stress_test_10.py",
  "parameters": {
    "synthetic": "true",
    "commit": "a62aed450194f49c3f2a4d9fa43dea99c541a83a",
    "repo_url": "git@github.com:albertobruin/test-pipeline.git",
    "resources": {
      "limits": {"cpu": "250m", "memory": "512Mi"},
      "requests": {"cpu": "250m", "memory": "256Mi"}
    },
    "ssh_secret": "assets-repo-clone",
    "vault_path": "clients/albertotest/connections",
    "vault_role": "airflow-python-task-albertotest",
    "annotations": {
      "getbruin.com/asset": "stress.test_10",
      "getbruin.com/client": "albertotest",
      "getbruin.com/dag_id": "albertotest-stress-test",
      "getbruin.com/project": "main",
      "getbruin.com/task_id": "af1e8eba62c35ef48942b2e49a4da5475a4a18ea405b346a1da6b23f8208e679.main.main",
      "getbruin.com/dag_run_id": "manual__2025-10-13T13:33:31.920959+00:00",
      "getbruin.com/project_id": "albertotest",
      "getbruin.com/try_number": "1"
    },
    "bruin_image": "v0.11.316",
    "ssh_secret_key": "gitSshKey",
    "data_interval_end": "2025-10-12T23:59:59.998999Z",
    "data_interval_start": "2025-10-12T00:00:00.000000Z"
  },
  "try_number": 1,
  "labels": ["test3", "tast4"]
}
EOF
)

  # Send curl request
  curl -s -o /dev/null -w "Response: %{http_code}\n" \
    -H "Authorization: Bearer ${AUTH}" \
    -H "Content-Type: application/json" \
    -X POST \
    --data "${DATA}" \
    "${URL}"

  # Wait 1/50 second
  sleep 0.01
done
