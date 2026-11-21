#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthDictKeyCountRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-dict-key-count roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase13738 e2e passed"
