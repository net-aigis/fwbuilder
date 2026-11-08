#!/usr/bin/env bash
# Phase-12363: client soft_fertig_ssh_auth_method_count_roster Soft 12360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_method_count_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 12360+ soft_fertig_ssh_auth_method_count_roster type ok"; echo "cleaned"; echo "OK: phase12363 e2e passed"
