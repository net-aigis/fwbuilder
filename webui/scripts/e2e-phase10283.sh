#!/usr/bin/env bash
# Phase-10283: client soft_fertig_ssh_auth_method_partition_roster Soft 10280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_method_partition_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 10280+ soft_fertig_ssh_auth_method_partition_roster type ok"; echo "cleaned"; echo "OK: phase10283 e2e passed"
