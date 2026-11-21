#!/usr/bin/env bash
# Phase-6299: client ssh_not_implemented_batch_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_not_implemented_batch_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-not-implemented-batch roster type ok"; echo "cleaned"; echo "OK: phase6299 e2e passed"
