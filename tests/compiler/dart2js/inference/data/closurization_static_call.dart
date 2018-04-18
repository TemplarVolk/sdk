// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/*element: main:[null]*/
main() {
  closurizedCallToString();
}

////////////////////////////////////////////////////////////////////////////////
// Implicit/explicit .call on static method tear-off with a non synthesized
// '.call' method in the closed world.
////////////////////////////////////////////////////////////////////////////////

/*element: method:[exact=JSUInt31]*/
method() => 42;

/*element: Class.:[exact=Class]*/
class Class {
  /*element: Class.call:Value([exact=JSBool], value: true)*/
  call() => true;
}

/*element: closurizedCallToString:[exact=JSString]*/
closurizedCallToString() {
  var c = new Class();
  c.call(); // Make `Class.call` live.
  var local = method;
  local
      .
      /*ast.invoke: [subtype=Function]*/
      /*kernel.invoke: [subtype=Function]*/
      /*strong.invoke: [subclass=Closure]*/
      toString();
  local();
  local
      .
      /*ast.invoke: [subtype=Function]*/
      /*kernel.invoke: [subtype=Function]*/
      /*strong.invoke: [subclass=Closure]*/
      toString();
  local.call();
  return local
      .
      /*ast.invoke: [subtype=Function]*/
      /*kernel.invoke: [subtype=Function]*/
      /*strong.invoke: [subclass=Closure]*/
      toString();
}
