// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class Supertype {
  factory Supertype() = X;
  factory Supertype() = X; //# 01: compile-time error
}

class X implements Supertype {
  X();
}

main() {
  X x = new Supertype();
}
