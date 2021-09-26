<?php if (empty($joke->id) || $user->id == $joke->authorId || $user->hasPermission(\Ijdb\Entity\Author::EDIT_JOKES)) : ?>
    <form action="" method="post">
        <input type="hidden" name="joke[id]" value="<?= $joke->id ?? '' ?>">
        <label for="joketext">Type your joke here:</label>
        <textarea id="joketext" name="joke[joketext]" rows="3" cols="40"><?= $joke->joketext ?? '' ?></textarea>

        <p>Select categories for this joke:</p>
        <?php foreach ($categories as $category) : ?>

            <?php if ($joke && $joke->hasCategory($category->id)) : ?>
                <input type="checkbox" checked name="category[]" value="<?= $category->id ?>" />
            <?php else : ?>
                <input type="checkbox" name="category[]" value="<?= $category->id ?>" />
            <?php endif; ?>

            <label><?= $category->name ?></label>
        <?php endforeach; ?>

        <input type="submit" name="submit" value="Save">
    </form>

    <?php if ($user->hasPermission(\Ijdb\Entity\Author::EDIT_USER_ACCESS)) : ?>
        <form action='/approve' method="post">
            <p>Select if joke is valid:</p>
            <input type="hidden" name="joke[id]" value="<?= $joke->id ?? '' ?>">
            <input type="radio" id="age1" name="joke[valid]" value="1" <?php if (isset($joke) && $joke->valid) : ?> checked <?php endif; ?>>
            <label for="age1">valid</label><br>
            <input type="radio" id="age0" name="joke[valid]" value="0" <?php if ((isset($joke) && !$joke->valid) || !isset($joke)) : ?> checked <?php endif; ?>>
            <label for="age0">invalid</label><br>
            <input type="submit" name="submit" value="Save">
        </form>
    <?php endif; ?>
<?php else : ?>

    <p>You may only edit jokes that you posted.</p>

<?php endif; ?>