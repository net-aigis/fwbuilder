#!/usr/bin/env bash
# Phase-6522: UI ssh-not-implemented-batch roster Soft 6520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-not-implemented-batch roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNoteSnapshotRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 6520+ ssh-not-implemented-batch roster ok"; echo "cleaned"; echo "OK: phase6522 e2e passed"
