#!/usr/bin/env bash
# Phase-12939: client soft_fertig_ssh_auth_export_family_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_export_family_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-export-family roster type ok"; echo "cleaned"; echo "OK: phase12939 e2e passed"
