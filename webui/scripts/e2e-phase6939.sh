#!/usr/bin/env bash
# Phase-6939: client ssh_auth_policy_refresh_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_policy_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-policy-refresh roster type ok"; echo "cleaned"; echo "OK: phase6939 e2e passed"
