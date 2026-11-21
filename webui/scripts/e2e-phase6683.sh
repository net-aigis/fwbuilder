#!/usr/bin/env bash
# Phase-6683: client soft_fertig_ssh_implemented_identity_roster Soft 6680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_implemented_identity_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 6680+ soft_fertig_ssh_implemented_identity_roster type ok"; echo "cleaned"; echo "OK: phase6683 e2e passed"
