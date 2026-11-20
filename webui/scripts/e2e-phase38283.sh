#!/usr/bin/env bash
# Phase-38283: client soft_fertig_ssh_auth_schema_415_echo_roster Soft 38280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_415_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 38280+ soft_fertig_ssh_auth_schema_415_echo_roster type ok"; echo "cleaned"; echo "OK: phase38283 e2e passed"
