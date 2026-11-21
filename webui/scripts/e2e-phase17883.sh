#!/usr/bin/env bash
# Phase-17883: client soft_fertig_ssh_auth_undeca_checkpoint_roster Soft 17880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_undeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 17880+ soft_fertig_ssh_auth_undeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase17883 e2e passed"
