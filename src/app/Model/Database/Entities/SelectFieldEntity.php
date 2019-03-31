<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 15:54
 */

namespace Stopka\MediaFactory\Model\Database\Entities;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Class SelectFieldEntity
 * @package Stopka\MediaFactory\Model\Database\Entities\Fields
 * @ORM\Entity()
 */
abstract class SelectFieldEntity extends FieldEntity
{
    /**
     * @var SelectOptionEntity[]|ArrayCollection
     * @ORM\OneToMany(targetEntity="SelectOptionEntity", mappedBy="selectField", cascade={"all"}, orphanRemoval=true)
     */
    private $options;

    protected function __construct(string $internalName, SelectFieldValueEntity $selectFieldValue)
    {
        parent::__construct($internalName, $selectFieldValue);
        $this->options = new ArrayCollection();
    }

    /**
     * @return SelectOptionEntity
     */
    public function addOption(): SelectOptionEntity
    {
        $option = new SelectOptionEntity($this);
        $this->options->add($option);
        return $option;
    }

    /**
     * @return array
     */
    public function getOptions(): array
    {
        return $this->options->toArray();
    }

    /**
     * @param SelectOptionEntity $option
     */
    public function removeOption(SelectOptionEntity $option): void
    {
        $this->options->remove($option);
    }
}
