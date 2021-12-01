(use '[clojure.string :only (split)])

(def input (map #(Short/parseShort %) (split
                                       (slurp "input.txt") #"\n")))

(defn check-inc [acc, i]
  (let [prev (first acc) res (last acc)]
    [i (if (and prev (< prev i)) (inc res) res)]
    ))


(def three-sum-input (map (fn [i] (reduce + i)) (partition 3 1 input)))

(printf "Result part 1: %s%n" (last (reduce check-inc [nil 0] input)))
(printf "Result part 2: %s%n" (last (reduce check-inc [nil 0] three-sum-input)))
