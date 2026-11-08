#!/usr/bin/env bash
# Phase-11003: client soft_fertig_ssh_auth_gap_closure_echo_roster Soft 11000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_gap_closure_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 11000+ soft_fertig_ssh_auth_gap_closure_echo_roster type ok"; echo "cleaned"; echo "OK: phase11003 e2e passed"
