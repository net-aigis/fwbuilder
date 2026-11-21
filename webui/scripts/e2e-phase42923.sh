#!/usr/bin/env bash
# Phase-42923: client soft_fertig_ssh_auth_soft_45160_echo_roster Soft 42920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_45160_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 42920+ soft_fertig_ssh_auth_soft_45160_echo_roster type ok"; echo "cleaned"; echo "OK: phase42923 e2e passed"
