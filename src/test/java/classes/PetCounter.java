package classes;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
public class PetCounter {
    private List<Map<String, Object>> pets;

    public PetCounter(List<Map<String, Object>> pets) {
        this.pets = pets;
    }

    public Map<String, Integer> countPetsWithSameName() {
        Map<String, Integer> petNameCount = new HashMap<>();

        for (Map<String, Object> pet : pets) {
            String name = (String) pet.get("name");
            petNameCount.put(name, petNameCount.getOrDefault(name, 0) + 1);
        }

        return petNameCount;
    }
}
