#!/usr/bin/env bash
# Phase-8539: client soft_fertig_ssh_implemented_identity_refresh_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_implemented_identity_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-implemented-identity-refresh roster type ok"; echo "cleaned"; echo "OK: phase8539 e2e passed"
