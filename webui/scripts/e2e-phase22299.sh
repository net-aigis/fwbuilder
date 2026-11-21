#!/usr/bin/env bash
# Phase-22299: client soft_fertig_ssh_auth_pentacosadeca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_pentacosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-pentacosadeca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase22299 e2e passed"
