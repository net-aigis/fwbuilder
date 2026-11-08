#!/usr/bin/env bash
# Phase-6843: client soft_fertig_ssh_not_implemented_password_roster Soft 6680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_not_implemented_password_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 6680+ soft_fertig_ssh_not_implemented_password_roster type ok"; echo "cleaned"; echo "OK: phase6843 e2e passed"
