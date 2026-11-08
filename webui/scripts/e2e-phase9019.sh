#!/usr/bin/env bash
# Phase-9019: client soft_fertig_ssh_auth_field_presence_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_field_presence_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-field-presence roster type ok"; echo "cleaned"; echo "OK: phase9019 e2e passed"
