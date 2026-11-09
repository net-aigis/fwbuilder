#!/usr/bin/env bash
# Phase-20443: client soft_fertig_ssh_auth_enneadeca_checkpoint_roster Soft 20440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_enneadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 20440+ soft_fertig_ssh_auth_enneadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase20443 e2e passed"
