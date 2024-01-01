import 'dart:math';

import 'package:algo_project/position.dart';
import 'package:algo_project/ui/shell.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'board.dart';
import 'constants.dart';

class HomeController extends GetxController {
  // 19 * 19 grid
  // a for regular cell
  // x for x cell
  // k for kitchen cells
  // / for ...

  List<List<String>> initCells = [
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'x', 'a', 'x', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ['a', 'a', 'x', 'a', 'a', 'a', 'a', 'a', 'k', 'k', 'k', 'a', 'a', 'a', 'a', 'a', 'x', 'a', '/'],
    ['a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'k', 'k', 'k', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a'],
    ['/', 'a', 'x', 'a', 'a', 'a', 'a', 'a', 'k', 'k', 'k', 'a', 'a', 'a', 'a', 'a', 'x', 'a', 'a'],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'x', 'a', 'x', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  ];

  List<List<String>> deepCopyMatrix(List<List<String>> og) {
    List<List<String>> copy = [];

    for (List<String> row in og) {
      List<String> temp = [];
      for (String cell in row) {
        temp.add(cell);
      }
      copy.add(temp);
    }
    return copy;
  }

  late Board initBoard;
  @override
  void onInit() {
    initBoard = Board(
      cells: deepCopyMatrix(initCells),
      cost: 1,
      depth: 0,
      heuristic: 0,
    );
    super.onInit();
  }

  // is player1 role
  bool role = true;

  // path that player1 stones take to reach kitchen
  final List<Position> path1 = [
    Position(9, 7),
    Position(9, 6),
    Position(9, 5),
    Position(9, 4),
    Position(9, 3),
    Position(9, 2),
    Position(9, 1),
    Position(9, 0),
    Position(8, 0),
    Position(8, 1),
    Position(8, 2),
    Position(8, 3),
    Position(8, 4),
    Position(8, 5),
    Position(8, 6),
    Position(8, 7),
    Position(7, 8),
    Position(6, 8),
    Position(5, 8),
    Position(4, 8),
    Position(3, 8),
    Position(2, 8),
    Position(1, 8),
    Position(0, 8),
    Position(0, 9),
    Position(0, 10),
    Position(1, 10),
    Position(2, 10),
    Position(3, 10),
    Position(4, 10),
    Position(5, 10),
    Position(6, 10),
    Position(7, 10),
    Position(8, 11),
    Position(8, 12),
    Position(8, 13),
    Position(8, 14),
    Position(8, 15),
    Position(8, 16),
    Position(8, 17),
    Position(8, 18),
    Position(9, 18),
    Position(10, 18),
    Position(10, 17),
    Position(10, 16),
    Position(10, 15),
    Position(10, 14),
    Position(10, 13),
    Position(10, 12),
    Position(10, 11),
    Position(11, 10),
    Position(12, 10),
    Position(13, 10),
    Position(14, 10),
    Position(15, 10),
    Position(16, 10),
    Position(17, 10),
    Position(18, 10),
    Position(18, 9),
    Position(18, 8),
    Position(17, 8),
    Position(16, 8),
    Position(15, 8),
    Position(14, 8),
    Position(13, 8),
    Position(12, 8),
    Position(11, 8),
    Position(10, 7),
    Position(10, 6),
    Position(10, 5),
    Position(10, 4),
    Position(10, 3),
    Position(10, 2),
    Position(10, 1),
    Position(10, 0),
    Position(9, 0),
    Position(9, 1),
    Position(9, 2),
    Position(9, 3),
    Position(9, 4),
    Position(9, 5),
    Position(9, 6),
    Position(9, 7),
  ];

  // path that player2 stones take to reach kitchen
  final List<Position> path2 = [
    Position(9, 11),
    Position(9, 12),
    Position(9, 13),
    Position(9, 14),
    Position(9, 15),
    Position(9, 16),
    Position(9, 17),
    Position(9, 18),
    Position(10, 18),
    Position(10, 17),
    Position(10, 16),
    Position(10, 15),
    Position(10, 14),
    Position(10, 13),
    Position(10, 12),
    Position(10, 11),
    Position(11, 10),
    Position(12, 10),
    Position(13, 10),
    Position(14, 10),
    Position(15, 10),
    Position(16, 10),
    Position(17, 10),
    Position(18, 10),
    Position(18, 9),
    Position(18, 8),
    Position(17, 8),
    Position(16, 8),
    Position(15, 8),
    Position(14, 8),
    Position(13, 8),
    Position(12, 8),
    Position(11, 8),
    Position(10, 7),
    Position(10, 6),
    Position(10, 5),
    Position(10, 4),
    Position(10, 3),
    Position(10, 2),
    Position(10, 1),
    Position(10, 0),
    Position(9, 0),
    Position(8, 0),
    Position(8, 1),
    Position(8, 2),
    Position(8, 3),
    Position(8, 4),
    Position(8, 5),
    Position(8, 6),
    Position(8, 7),
    Position(7, 8),
    Position(6, 8),
    Position(5, 8),
    Position(4, 8),
    Position(3, 8),
    Position(2, 8),
    Position(1, 8),
    Position(0, 8),
    Position(0, 9),
    Position(0, 10),
    Position(1, 10),
    Position(2, 10),
    Position(3, 10),
    Position(4, 10),
    Position(5, 10),
    Position(6, 10),
    Position(7, 10),
    Position(8, 11),
    Position(8, 12),
    Position(8, 13),
    Position(8, 14),
    Position(8, 15),
    Position(8, 16),
    Position(8, 17),
    Position(8, 18),
    Position(9, 18),
    Position(9, 17),
    Position(9, 16),
    Position(9, 15),
    Position(9, 14),
    Position(9, 13),
    Position(9, 12),
    Position(9, 11),
  ];

  // location of every player1 piece on path1
  List<int> p1 = [-1, -1, -1, -1];

  // location of every player2 pieces on path2
  List<int> p2 = [-1, -1, -1, -1];

  // throw name, depending on the num of closed shells
  final Map<int, String> throwName = {
    0: "شكة",
    1: "دست",
    2: "دواق",
    3: "تلاتة",
    4: "أربعة",
    5: "بنج",
    6: "بارا",
  };

  final Map<String, int> actionValue = {
    "خال": 1,
    "شكة": 6,
    "دست": 10,
    "دواق": 2,
    "تلاتة": 3,
    "أربعة": 4,
    "بنج": 24,
    "بارا": 12,
  };

  // X cells
  Set<Position> castle = {
    Position(2, 10),
    Position(2, 8),
    Position(8, 16),
    Position(10, 16),
    Position(8, 2),
    Position(10, 2),
    Position(16, 10),
    Position(16, 8),
  };

  // cells in the middle
  Set<Position> kitchen = {
    Position(8, 10),
    Position(8, 9),
    Position(8, 8),
    Position(9, 10),
    Position(9, 9),
    Position(9, 8),
    Position(10, 10),
    Position(10, 9),
    Position(10, 8),
  };

  List<String> actions = [];

  int remainingThrows = 1;

  // just a test, don't mind it
  void drawPath() async {
    for (Position pos in kitchen) {
      initBoard.cells[pos.r][pos.c] == ' ' || initBoard.cells[pos.r][pos.c] == 'k'
          ? initBoard.cells[pos.r][pos.c] = 'a'
          : initBoard.cells[pos.r][pos.c] = ' ';
      print("${pos.r},${pos.c}");
      await Future.delayed(const Duration(milliseconds: 200));
      update();
    }
  }

  void restartGame() {
    initBoard = Board(
      cells: deepCopyMatrix(initCells),
      cost: 1,
      depth: 0,
      heuristic: 0,
    );
    update();
  }

  void throwShells() {
    if (remainingThrows == 0) return;
    int res = randomWithProbability();
    List<Widget> shells = [];
    for (int i = 0; i < 6; i++) {
      shells.add(Shell(closed: i < res));
    }

    switch (res) {
      case 0:
        {
          remainingThrows++;
          actions.add("شكة"); // move 6
        }
      case 1:
        {
          remainingThrows++;
          actions.add("خال");
          actions.add("دست"); // move 10
        }
      case 2:
        {
          actions.add("دواق"); // move 2
        }
      case 3:
        {
          actions.add("تلاتة"); // move 3
        }
      case 4:
        {
          actions.add("أربعة"); // move 4
        }
      case 5:
        {
          remainingThrows++;
          actions.add("خال");
          actions.add("بنج"); // move 24
        }
      case 6:
        {
          remainingThrows++;
          actions.add("بارا"); // move 12
        }

      default:
        print("wtf");
    }
    remainingThrows--;
    // or if there is no valid action for all player's stones
    if (remainingThrows == 0 && (actions.isEmpty || noActionAvailable())) {
      print("after throw");
      actions.clear();
      role = !role;
      remainingThrows++;
    }
    update();
    Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(seconds: 2),
        titleText: Text(
          throwName[res]!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: kNormalColor,
          ),
        ),
        messageText: Row(
          children: shells,
        ),
      ),
    );
  }

  int randomWithProbability() {
    Random random = Random();
    double randomNumber = random.nextDouble();

    if (randomNumber < 0.015625) {
      return 0;
    } else if (randomNumber < 0.109375) {
      return 1;
    } else if (randomNumber < 0.34375) {
      return 2;
    } else if (randomNumber < 0.65625) {
      return 3;
    } else if (randomNumber < 0.890625) {
      return 4;
    } else if (randomNumber < 0.984375) {
      return 5;
    } else {
      return 6;
    }
  }

  void doAction(int id, String action) {
    if (remainingThrows > 0 || !validateAction(id, action)) return;

    role ? p1[id] += actionValue[action]! : p2[id] += actionValue[action]!;
    actions.remove(action);
    eliminate(id); // pass the id of the eliminator
    // if actions is empty or there is no available action left , switch roles and increment throws and empty actions
    if (actions.isEmpty || noActionAvailable()) {
      role = !role;
      remainingThrows++;
      actions.clear();
    }
    update();
  }

  List<String> showActions(int id) {
    List<String> res = [];
    for (String action in actions.toSet()) {
      if (validateAction(id, action)) res.add(action);
    }
    print(res);
    return res;
  }

  bool validateAction(int id, String action) {
    int val = actionValue[action]!;
    bool blocked = role ? opponentInCastle(path1[p1[id] + val]) : opponentInCastle(path2[p2[id] + val]);
    bool outOfBounds = role ? p1[id] + val > 84 : p2[id] + val > 84;
    bool outside = action != "خال" && (role ? p1[id] == -1 : p2[id] == -1);
    print("$action: $blocked, $outOfBounds, $outside");
    return !blocked && !outOfBounds && !outside;
  }

  bool opponentInCastle(Position pos) {
    if (role) {
      for (int stone in p2) {
        if (stone == -1) continue;
        if (path2[stone] == pos && castle.contains(pos)) return true;
      }
      return false;
    }

    for (int stone in p1) {
      if (stone == -1) continue;
      if (path1[stone] == pos && castle.contains(pos)) return true;
    }
    return false;
  }

  bool eliminate(int id) {
    Position pos = role ? path1[p1[id]] : path2[p2[id]];
    if (opponentInCastle(pos)) return false;
    if (role) {
      for (int i = 0; i < p2.length; i++) {
        if (path2[p2[i]] == pos) {
          p2[i] = -1;
          return true;
        }
      }
      return false;
    }

    for (int i = 0; i < p1.length; i++) {
      if (path1[p1[i]] == pos) {
        p1[i] = -1;
        return true;
      }
    }
    return false;
  }

  bool noActionAvailable() {
    for (String action in actions) {
      for (int i = 0; i < 4; i++) {
        if (validateAction(i, action)) {
          return false;
        }
      }
    }
    return true;
  }

  void test() {
    role = !role;
    update();
  }
}
