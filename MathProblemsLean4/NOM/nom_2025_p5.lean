import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Data.Nat.Basic
import Mathlib.Tactic
import Mathlib.Data.List.Defs

open Nat

-- Булева проверка дали едно число е просто
def isPrimeBool (p : ℕ) : Bool :=
  decide (Nat.Prime p)

-- Булева проверка дали едно число е квадратно свободно
def isSquareFree (n : ℕ) : Bool :=
  let bound := Nat.sqrt n + 1;
  !(List.range' 2 bound).any (λ d ↦ n % (d * d) == 0 && isPrimeBool d)

-- Брой на квадратно свободните числа в интервала {a+1, ..., a+n}
def countSquareFreeInRange (a n : ℕ) : ℕ :=
  ((List.range n).map (λ i ↦ a + i + 1)).filter isSquareFree |>.length

-- Основната теорема: съществува такова a, че броят на квадратно свободните числа е ⌊n / 4⌋
theorem nom_2025_p5 (n : ℕ) :
  ∃ a : ℕ, countSquareFreeInRange a n = n / 4 :=
sorry
