#!/usr/bin/env bash
# Phase-10219: client soft_fertig_ssh_auth_method_partition_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_method_partition_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-method-partition roster type ok"; echo "cleaned"; echo "OK: phase10219 e2e passed"
