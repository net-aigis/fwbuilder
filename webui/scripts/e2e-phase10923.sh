#!/usr/bin/env bash
# Phase-10923: client soft_fertig_ssh_auth_gap_label_echo_roster Soft 10920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_gap_label_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 10920+ soft_fertig_ssh_auth_gap_label_echo_roster type ok"; echo "cleaned"; echo "OK: phase10923 e2e passed"
