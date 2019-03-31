<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 17:09
 */

namespace Stopka\MediaFactory\Model\Database\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * Class MultiSelectFieldValueEntity
 * @package Stopka\MediaFactory\Model\Database\Entities\FieldValues
 * @ORM\Entity()
 */
class MultiSelectFieldValueEntity extends SelectFieldValueEntity
{

    /**
     * @param SelectOptionEntity[] $options
     */
    public function selectOptions(array $options): void
    {
        foreach ($options as $option) {
            $this->selectOption($option);
        }
    }

    /**
     * @param SelectOptionEntity[] $options
     */
    public function unselectOptions(array $options): void
    {
        foreach ($options as $option) {
            $this->unselectOptions($option);
        }
    }
}
