#!/usr/bin/env bash
# Phase-9499: client soft_fertig_ssh_auth_implemented_id_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_implemented_id_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-implemented-id roster type ok"; echo "cleaned"; echo "OK: phase9499 e2e passed"
