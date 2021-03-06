export PKGIX_REPOS="${TEST_REPOS}/10-simple"

test_comment "List packages in repo."
test_call $EXIT_OK pkgix -n avail

test_comment "Initial install."
test_call $EXIT_OK pkgix -n install simple testpackage

test_comment "Install again: should do nothing."
test_call $EXIT_OK pkgix -n install simple testpackage

verify simple 9321b50a50457fd6a992b43e537514fcdf35a35947e0e1f8617e95bbb4e61abd

test_comment "Upgrading: should report nothing to upgrade."
test_call $EXIT_OK pkgix -n upgrade simple

test_comment "List installed packages."
test_call $EXIT_OK pkgix -n list simple

verify simple 573576b0da634f7b4737f501143bd44483439bb04483473070b4b1f6d5f1cd9b
verify_log    ab3db0d8943980ddd3cd6953506495e6cbbe9a38cb7d93ec647cca905d6ce4fa
