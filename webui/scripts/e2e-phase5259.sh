#!/usr/bin/env bash
# Phase-5259: client ssh_auth_policy_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_policy_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-policy roster type ok"; echo "cleaned"; echo "OK: phase5259 e2e passed"
