To reproduce:

```
$ perl6 -Ilib/Bad t/segv.t
Segmentation fault (core dumped)
$ $(which perl6) -Ilib/Good t/segv.t
$
```

I'm running:

```
This is Rakudo version 2018.10 built on MoarVM version 2018.10
implementing Perl 6.c.
```

The difference between the Good and Bad library is commenting
out one of the operators defined in Ops, doesn't matter which:

```
$ diff -Naur -x .precomp lib/{Bad,Good}
diff -Naur -x .precomp lib/Bad/Ops.pm6 lib/Good/Ops.pm6
--- lib/Bad/Ops.pm6     2018-11-13 13:18:24.517208021 +0100
+++ lib/Good/Ops.pm6    2018-11-13 13:18:52.067209276 +0100
@@ -1,4 +1,4 @@
 unit module Ops;
 
 multi sub prefix:<¬> (Bool $p)     is export { not $p        }
-multi sub  infix:<∧> (Bool $p, $q) is export {     $p and $q }
+#multi sub  infix:<∧> (Bool $p, $q) is export {     $p and $q }
```
