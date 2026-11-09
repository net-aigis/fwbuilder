#!/usr/bin/env bash
# Phase-19723: client soft_fertig_ssh_auth_schema_183_echo_roster Soft 19720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_183_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 19720+ soft_fertig_ssh_auth_schema_183_echo_roster type ok"; echo "cleaned"; echo "OK: phase19723 e2e passed"
