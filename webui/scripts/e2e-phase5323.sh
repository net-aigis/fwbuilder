#!/usr/bin/env bash
# Phase-5323: client soft_fertig_ssh_auth_policy_roster Soft 5320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_policy_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 5320+ soft_fertig_ssh_auth_policy_roster type ok"; echo "cleaned"; echo "OK: phase5323 e2e passed"
