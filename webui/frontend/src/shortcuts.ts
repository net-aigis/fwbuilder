/** Keyboard shortcuts shown in the Help overlay (?). */
export type ShortcutEntry = { keys: string; action: string; scope?: string };

export const SHORTCUTS: ShortcutEntry[] = [
  { keys: "?", action: "Show this shortcuts help" },
  { keys: "Esc", action: "Close overlay / clear search / clear rule filters" },
  { keys: "Ctrl+S", action: "Save" },
  { keys: "Ctrl+Shift+S", action: "Save as" },
  { keys: "Ctrl+E", action: "Compile current firewall", scope: "rules" },
  { keys: "Ctrl+Shift+E", action: "Compile all firewalls" },
  { keys: "Ctrl+I", action: "Project stats" },
  { keys: "Ctrl+Shift+F", action: "Focus rule text filter", scope: "rules" },
  { keys: "Ctrl+Shift+C", action: "Copy object id", scope: "object" },
  { keys: "Ctrl+Shift+P", action: "Copy object path", scope: "object" },
  { keys: "F2", action: "Rename selected object", scope: "object" },
  { keys: "/", action: "Focus object search" },
  { keys: "Alt+R", action: "Open Policy rules (Firewall/Cluster)" },
  { keys: "Alt+N", action: "Open NAT rules (Firewall/Cluster)" },
  { keys: "Alt+G", action: "Open Routing rules (Firewall/Cluster)" },
  { keys: "Alt+P", action: "Cycle Policy → NAT → Routing", scope: "rules" },
  { keys: "Alt+D", action: "Deploy dry-run (compile first)" },
  { keys: "Alt+↑ / Alt+↓", action: "Move selected rule", scope: "rules" },
  { keys: "↑ / ↓", action: "Select previous / next visible rule", scope: "rules" },
  { keys: "Home / End", action: "First / last visible rule", scope: "rules" },
  { keys: "PageUp / PageDown", action: "Jump ±10 visible rules", scope: "rules" },
  { keys: "Insert / Ctrl+Enter", action: "Add rule at bottom (Shift+Insert = top)", scope: "rules" },
  { keys: "Space", action: "Toggle rule disabled", scope: "rules" },
  { keys: "Delete / Ctrl+D", action: "Delete selected rule", scope: "rules" },
  { keys: "f", action: "Cycle disabled filter (all → hide → only)", scope: "rules" },
  { keys: "a", action: "Cycle action filter (all → each action)", scope: "rules" },
  { keys: "u", action: "Cycle group filter (all → each group)", scope: "rules" },
  { keys: "t", action: "Copy selected rule as TSV", scope: "rules" },
  { keys: "y", action: "Copy selected rule as JSON", scope: "rules" },
  { keys: "o", action: "Toggle only-disabled filter", scope: "rules" },
  { keys: "n / Shift+N", action: "Next / previous disabled rule", scope: "rules" },
  { keys: "j", action: "Jump to rule position", scope: "rules" },
  { keys: "c", action: "Edit rule comment", scope: "rules" },
  { keys: "m", action: "Edit rule group", scope: "rules" },
  { keys: "l", action: "Toggle rule logging", scope: "rules" },
  { keys: "g", action: "Cycle rule direction", scope: "rules" },
  { keys: "Delete / Backspace", action: "Delete selected object", scope: "object" },
  { keys: "Ctrl+D", action: "Duplicate selected object", scope: "object" },
];

export function shortcutsAsText(): string {
  return SHORTCUTS.map((s) => {
    const scope = s.scope ? ` [${s.scope}]` : "";
    return `${s.keys}\t${s.action}${scope}`;
  }).join("\n");
}
