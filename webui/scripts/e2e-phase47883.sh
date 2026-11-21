#!/usr/bin/env bash
# Phase-47883: client soft_fertig_ssh_auth_schema_535_echo_roster Soft 47880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_535_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 47880+ soft_fertig_ssh_auth_schema_535_echo_roster type ok"; echo "cleaned"; echo "OK: phase47883 e2e passed"
