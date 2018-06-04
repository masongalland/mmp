var recipe = {
    recipeId: 1,
    ownerId: 1,
    recipeName: 'PB & J',
    recipe_photo: 'photo-url',
    description: 'Nothing goes better together than peanut butter and jelly!',
    servings: 2,
    prepTime: 3,
    meal: 'lunch',
    tags: ['sandwich', 'peanut butter', 'jelly'],
    privacySetting: 'everyone',
    steps: {
        1: 'spread a layer of peanut butter onto one of the slices of bread',
        2: 'spread a layer of jelly onto the other slice of bread',
        3: 'put slices together and cut in half'
    },
    ingredients: [
        {
            name: 'peanut butter',
            quantity: 1,
            unit: 'Tblsp'
        },
        {
            name: 'jelly',
            quantity: 1,
            unit: 'Tblsp'
        },
        {
            name: 'bread',
            quantity: 2,
            unit: 'slice'
        }

    ],
    tools: ['knife', 'plate']

}