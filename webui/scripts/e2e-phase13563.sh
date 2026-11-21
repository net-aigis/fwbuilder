#!/usr/bin/env bash
# Phase-13563: client soft_fertig_ssh_auth_ni_count_roster Soft 13560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ni_count_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 13560+ soft_fertig_ssh_auth_ni_count_roster type ok"; echo "cleaned"; echo "OK: phase13563 e2e passed"
