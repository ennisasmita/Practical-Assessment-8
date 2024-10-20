package examples.tests;

import com.intuit.karate.junit5.Karate;

class Runner {
    @Karate.Test
    public Karate runRecipe() {
        return Karate.run("Recipe").relativeTo(getClass());
    }

}
