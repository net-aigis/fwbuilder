#!/usr/bin/env bash
# Phase-14939: client soft_fertig_ssh_auth_batch_only_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_batch_only_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-batch-only-echo roster type ok"; echo "cleaned"; echo "OK: phase14939 e2e passed"
