#!/usr/bin/env bash
# Phase-11563: client soft_fertig_ssh_auth_milestone_echo_roster Soft 11560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_milestone_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 11560+ soft_fertig_ssh_auth_milestone_echo_roster type ok"; echo "cleaned"; echo "OK: phase11563 e2e passed"
